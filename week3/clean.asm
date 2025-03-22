
         cmp rdx, #10
          jl LessThan10 # num < 10

          cmp rdx, #100
          jge GreaterThan99

          # print("num greater than or equal to 10 and less than 100")
          jmp End
GreaterThan99:
          # print("num is greater than or equal to 10 and more than 99")
          jmp End

LessThan10:
          cmp ldx, #5
          lge GreaterThanOrEqualTo5
          # print ("num is less than 5")
          jmp End
GreaterThanOrEqualTo5:
           # print("num is greater than or equal to 10 and more than 99")

End:
           EndProgram 