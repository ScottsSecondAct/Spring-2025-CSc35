# if (num >= 10)
#{
#  if (num < 100)
#   print("num greater or equal to 10 and less than 100")
#  else
#   print("num is greater than or equal to 10 and more than 99")
#}
#else 
#{
#  if (num < 5)
#    print ("num is thes than 5)
#  else
#    print ("num is greater or equal to 5)
#}

          cmp rdx, #10
          jl LessThan10 # num < 10
# *** outer true
#  if (num < 100)
#    print("num greater or equal to 10 and less than 100")
#  else
#   print("num is greater than or equal to 10 and more than 99")
          cmp rdx, #100
          jge GreaterThan99

          # print("num greater than or equal to 10 and less than 100")

          jmp End
GreaterThn99:
          # print("num is greater than or equal to 10 and more than 99")
          
          jmp End

LessThan10:
# *** Outer False
#  if (num < 5)
#    print ("num is thes than 5)
#  else
#    print ("num is greater or equal to 5)
          cmp ldx, #5
          lge GreaterOEqualTo5
          # print ("num is thess than 5)
          jmp End
GreaterOEqualTo5:
           # print("num is greater than or equal to 10 and more than 99")

           EndProgram