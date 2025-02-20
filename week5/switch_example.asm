# day_number = int("Enter a positive integer representing the day (Monday = 1, Sunday = 7): ") 
#
# match day_number:
#   case 1:
#     print("Monday, Lunes, or Lundi.")
#   case 2:
#     print("Tuesday, Martes, or Mardi.")
#   case 3:
#     print("Wednesday, Miercoles, or Mercredi.")
#   case 4:
#     print("Thursday, Jueves, or Jeudi.")
#   case 5:
#     print("Friday, Viernes, or Vendredi.")
#   case 6:
#     print("Saturday, Sabado, or Samdedi.")
#   case 7:
#     print("Sunday, Domingo, or Dimanche.")
#   case _:
#         print("On Planet Earth we have 7 days a week,  What Planet are you from?"")
.intel_syntax noprefix

.data
PromptForIntegerString:
    .ascii "Enter a positive integer representing the day (Monday = 1, Sunday = 7): \0"

MondayString:
    .ascii "Monday, Lunes, or Lundi.\n\0"

TuesdayString:
    .ascii "Tuesday, Martes, or Mardi.\n\0"

WednesdayString:
    .ascii "Wednesday, Miercoles, or Mercredi.\n\0"

ThursdayString:
    .ascii "Thursday, Jueves, or Jeudi.\n\0"

FridayString:
    .ascii "Friday, Viernes, or Vendredi.\n\0"

SaturdayString:
    .ascii "Saturday, Sabado, or Samdedi.\n\0"

SundayString:
    .ascii "Sunday, Domingo, or Dimanche.\n\0"

DefaultString:
    .ascii "On Planet Earth we have 7 days a week,  What Planet are you from?\n\0"

.text
.global Main
Main:
    # Prompt user
    lea     rdx, PromptForIntegerString
    call    PrintString

    # Read integer
    call    ScanInteger
    
    cmp     rdx, 1
    je      Monday
    cmp     rdx, 2
    je      Tuesday
    cmp     rdx, 3
    je      Wednesday
    cmp     rdx, 4
    je      Thursday
    cmp     rdx, 5
    je      Friday
    cmp     rdx, 6
    je      Saturday
    cmp     rdx, 7
    je      Sunday

    jmp     Default

Monday:
    lea     rdx, MondayString
    call    PrintString
    jmp     End

Tuesday:
    lea     rdx, TuesdayString
    call    PrintString
    jmp     End

Wednesday:
    lea     rdx, WednesdayString
    call    PrintString
    jmp     End

Thursday:
    lea     rdx, ThursdayString
    call    PrintString
    jmp     End

Friday:
    lea     rdx, FridayString
    call    PrintString
    jmp     End

Saturday:
    lea     rdx, SaturdayString
    call    PrintString
    jmp     End

Sunday:
    lea     rdx, SundayString
    call    PrintString
    jmp     End

Default:
    lea     rdx, DefaultString
    call    PrintString

End:
    call    EndProgram
