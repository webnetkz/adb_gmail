#!/bin/bash

# Функция для создания аккаунта Gmail
create_gmail_account() {
    # Параметры
    FIRST_NAME=$1
    LAST_NAME=$2
    DAY=$3
    YEAR=$4
    EMAIL_NAME=$5
    PASSWORD=$6
    TEL=$7


    # Ваши ADB команды
    adb shell am start -a android.intent.action.VIEW -d "https://gmail.com" com.android.chrome
    /bin/sleep 4
    adb shell input tap 1000 100 # Settings
    adb shell input tap 1000 400 # Incognito
    /bin/sleep 3
    adb shell input tap 500 200 # Search Line
    /bin/sleep 1
    adb shell input text "gmail.com"
    adb shell input keyevent 66 # Enter
    /bin/sleep 3
    adb shell input tap 500 700
    /bin/sleep 1
    adb shell input tap 300 800
    adb shell input tap 400 1530 # Create Button
    adb shell input tap 400 1600 # New Account
    /bin/sleep 2
    adb shell input tap 400 1100 # FirstName
    adb shell input text "$FIRST_NAME"
    adb shell input keyevent 66 # Enter
    adb shell input tap 400 1300 # LastName
    adb shell input text "$LAST_NAME"
    adb shell input keyevent 66 # Enter
    /bin/sleep 2

    # Select date
    adb shell input tap 100 900 # Select Day
    adb shell input text "$DAY"
    adb shell input tap 400 900 # Select Month
    /bin/sleep 0.5
    adb shell input tap 100 500 # Month
    /bin/sleep 1
    adb shell input tap 900 900 # Select Year
    adb shell input text "$YEAR"
    /bin/sleep 0.5
    adb shell input tap 900 900 # Gender
    adb shell input tap 700 1100 # Select Gender
    /bin/sleep 0.5
    adb shell input tap 700 1100 # Select Gender
    adb shell input tap 900 1500 # Next
    /bin/sleep 2

    # Create New Name Gmail
    adb shell input tap 100 1290 
    /bin/sleep 1
    adb shell input tap 300 800
    /bin/sleep 0.5
    adb shell input tap 500 1500 
    adb shell input text "${EMAIL_NAME}"
    adb shell input keyevent 61
    adb shell input keyevent 66
    /bin/sleep 2

    # Input pass
    adb shell input text "$PASSWORD"
    adb shell input keyevent 66
    adb shell input tap 300 1330
    adb shell input text "$PASSWORD"
    adb shell input keyevent 66

    # Input tel
    /bin/sleep 2
    adb shell input tap 700 1000
    /bin/sleep 0.5
    adb shell input text $TEL
    adb shell input tap 300 800
    adb shell input tap 910 1480

}

# Проверка на количество аргументов
if [ $# -ne 7 ]; then
    echo "Использование: $0 <First Name> <Last Name> <Day> <Year> <Email name> <Password> <Tel>"
    exit 1
fi

# Вызов функции с переданными аргументами
create_gmail_account "$1" "$2" "$3" "$4" "$5" "$6" "$7"
#./trycatch.sh "Jhon" "Due" "02" "1990" "0001try0003catch" "thisIsPass123123" "7776660041"
