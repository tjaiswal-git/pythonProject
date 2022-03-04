import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from robot.api.deco import library, keyword
import smtplib
from os.path import basename
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.utils import formatdate

from robot.libraries.BuiltIn import BuiltIn


@library
class EmailNotificationUtility(object):

    def __init__(self, server, from_user, from_password, to, subject, text, files=None):
        self.server = server
        self.from_user = from_user
        self.from_password = from_password
        self.to = to
        self.subject = subject
        self.text = text
        self.files = files
        files = str(files).split(",")
        self.all_files = []
        for i in files:
            self.all_files.append(i)
        # self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def send_mail_no_attachment(self):
        msg = MIMEMultipart()

        msg['From'] = self.from_user
        msg['To'] = self.to
        msg['Subject'] = self.subject

        msg.attach(MIMEText(self.text))

        mailServer = smtplib.SMTP(self.server)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(self.from_user, self.from_password)
        mailServer.sendmail(self.from_user, self.to, msg.as_string())
        mailServer.close()

    @keyword
    def send_mail_with_attachment(self):
        BuiltIn().log(self.all_files)
        msg = MIMEMultipart()
        msg['From'] = self.from_user
        msg['To'] = self.to
        msg['Date'] = formatdate(localtime=True)
        msg['Subject'] = self.subject

        msg.attach(MIMEText(self.text))
        for fname in self.all_files or []:
            BuiltIn().log(fname)
            with open(fname, "rb") as fil:
                part = MIMEApplication(
                    fil.read(),
                    Name=basename(fname)
                )
            # After the file is closed
            part['Content-Disposition'] = 'attachment; filename="%s"' % basename(fname)
            msg.attach(part)
        mailServer = smtplib.SMTP(self.server)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(self.from_user, self.from_password)
        mailServer.sendmail(self.from_user, self.to, msg.as_string())
        mailServer.close()
