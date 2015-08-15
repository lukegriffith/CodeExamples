hourCharge = 0.51
dailyCharge = hourCharge * 24
monthlyCharge = dailyCharge * 30

twentyServerDaily = dailyCharge * 20
twentyServerMonthly = monthlyCharge * 20

budget = 918
hours = budget / hourCharge
days = hours / 24

print('Daily charge of running the server is ${}' .format(dailyCharge))
print('Monthly charge of running the server is ${}' .format(monthlyCharge))
print('Twenty servers per day ${}' .format(twentyServerDaily))
print('Twenty servers per month ${}' .format(twentyServerMonthly))
print('with $918, I can operate one server for {} days' .format(int(days)))
