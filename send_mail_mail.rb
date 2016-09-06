require "pony"
require "io/console"

puts "Введите адрес электронной почты: (только от mail.ru) "

my_mail = gets.chomp

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправлять письмо?"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.encode('UTF-8').chomp

Pony.mail(
{
	:subject => "Привет из руби!",
	:body => body,
	:to => send_to,
	:from => my_mail,

	:via => :smtp,
	:via_options => {
					:address => 'smtp.mail.ru', #это хост, сервер отправки
					:port => '465', #порт
					:tls => true, #если сервер работает в режиме tls
					:user_name => my_mail, #используем наш адресс почты
					:password => password, #задаем введённый в консоль пароль
					:authentication => :plain #обычный тип авторизации
			  }
}

	)

puts "Письмо успешно отправлено!"