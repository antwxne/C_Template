# Var
MAIN	=	$(addprefix sources/, main.c)
SRC	=
OBJ	=	$(SRC:.c=.o)
MAIN_OBJ	=	$(MAIN:.c=.o)
NAME	=	a.out
CC	=	gcc
RM	?= rm -f

# Flags

CFLAGS	=	-Wall -Wextra
CPPFLAGS	=	-iquote ./include
LDFLAGS	=
LDLIBS	=

# Rules
.PHONY:	all
all:	$(OBJ)	$(MAIN_OBJ)
	$(CC) -o $(NAME) $(OBJ) $(MAIN_OBJ) $(LDFLAGS) $(LDLIBS)

.PHONY:	clean
clean:
	$(RM) $(OBJ) $(MAIN_OBJ)

.PHONY:	fclean
fclean:	clean
	$(RM) $(NAME)

.PHONY:	re
re: fclean all

.PHONY:	debug
debug: CFLAGS += -g3
debug: re