//Suma prin procedura
.data
      x:       .long 3
      y:       .long 4
      s:       .space 4
      msj:     .asciz "Suma este %d\n"
      format:   .asciz "%d %d"
      txt:      .asciz "Introduceti numerele:\n"
.text
suma:
   
   movl 4(%esp), %eax
   addl 8(%esp), %eax
   movl 12(%esp), %ebx
   movl %eax, 0(%ebx)
   
   ret



.global main
main:
     //User-friendly text:
   movl $4, %eax
   movl $1, %ebx
   movl $txt, %ecx
   movl $23, %edx
   int $0x80
   
     //Citire numere:   
//   pushl $x
//   pushl $y
//   push $format
//   call scanf
//   popl %ebx
//   popl %ebx
//   popl %ebx
//   popa

      //Apel functie:
   pushl $s
   pushl y
   pushl x
   call suma
   popl %ebx
   popl %ebx
   popl %ebx
       
       //Afisare element returnat in s:
   pusha
   pushl s
   pushl $msj
   call printf
   popl %ebx
   popl %ebx
   popa 
   
   push $0
   call fflush
   popl %ebx
        
        //Finalizarea programului:
   movl $1, %eax
   movl $0, %ebx
   int $0x80
   
