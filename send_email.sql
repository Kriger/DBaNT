-- Зависит от наличия поддержки языка Python 3 на сервере
-- **************************************************************
-- * Для разрешения зависимостей выполните в консоли:           *
-- * sudo apt install postgresql-plpython3-9.6                  *
-- * актуально для postgresql 9.6 в debian/ubuntu и производных *
-- **************************************************************

-- Задаём саму функцию
CREATE OR REPLACE FUNCTION send_email(_from text, _password text, smtp text, port integer, bcc text, receiver text, subject text, send_message text)
  RETURNS text AS

$BODY$

import smtplib
from smtplib import SMTPException

message = ("From: %s\nTo: %s\nBcc: %s\nMIME-Version: 1.0\nContent-type: text/html\nSubject: %s\n\n %s" % (_from,receiver,bcc,subject,send_message))
try:
  smtp = smtplib.SMTP(smtp, port)
  smtp.starttls()
  smtp.login(_from, _password)
  smtp.sendmail(_from,receiver, message.encode('utf-8'))
  print('Successfully sent email')
except SMTPException:
  print('Error: unable to send email')

return message

$BODY$

  LANGUAGE plpython3u VOLATILE;

-- Задаём владельца функции
ALTER FUNCTION send_email(text, text, text, integer, text, text, text, text)
  OWNER TO "postgres";

-- Добавляем комментарий для описания функции
COMMENT ON FUNCTION send_email(text, text, text, integer, text, text, text, text) IS 'Отправка сообщений через функцию в базе данных.';
