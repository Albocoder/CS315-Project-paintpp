#include <cstdlib>
#include <stdio.h>
int yyparse();

int main()
{
  int ret = yyparse();
  if (ret!=0)
    return EXIT_FAILURE;
  return EXIT_SUCCESS;
}
