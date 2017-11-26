import smtplib
import sys
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders
 
fromaddr = "barryallenx509@gmail.com"
toaddr = "bitterypaul@gmail.com"
 
msg = MIMEMultipart()
 
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = sys.argv[1]
 
body = sys.argv[2]
 
msg.attach(MIMEText(body, 'plain'))
 
#filename = "NAME OF THE FILE WITH ITS EXTENSION"
#attachment = open("PATH OF THE FILE", "rb")
 
#part = MIMEBase('application', 'octet-stream')
#part.set_payload((attachment).read())
#encoders.encode_base64(part)
#part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
 
#msg.attach(part)
 
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(fromaddr, "9650oB@rry")
text = msg.as_string()
server.sendmail(fromaddr, toaddr, text)
server.quit()
