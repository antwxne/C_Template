##
## EPITECH PROJECT, 2023
## C_Template
## File description:
## Makefile
##


NAME	= a.out
TEST_NAME	=	unit_tests

SRC_DIR	=	sources/
TESTS_DIR	=	tests/

SRC	=	$(addprefix $(SRC_DIR), main.c \
								for_unit_tests.c)
OBJ	=	$(SRC:.c=.o)
TESTS_SRC	=	$(addprefix $(TESTS_DIR), basic_assertions.c \
	basic_parameterized.c)
TESTS_OBJ	=	$(TESTS_SRC:.c=.o)

CC	=	gcc
rm	?=	rm -f
CFLAGS	=	-Wall -Wextra -Werror
CPPFLAGS	=	
LDLIBS	=
LDFLAGS	=

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(LDLIBS)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

debug: CFLAGS += -g3
debug: re

tests_run: CFLAGS += -fprofile-arcs -ftest-coverage -O0
tests_run: LDLIBS += -lcriterion -lgcov
tests_run: SRC := $(filter-out $(addprefix $(SRC_DIR), main.c), $(SRC))
tests_run: $(OBJ) $(TESTS_OBJ)
	$(CC) -o $(TEST_NAME) $(OBJ) $(TESTS_OBJ) $(LDFLAGS) $(LDLIBS)
	./$(TEST_NAME)

coverage: tests_run
coverage:
	lcov --capture --directory sources/ --output-file tests_coverage.info
	genhtml tests_coverage.info --output-directory CODE_COVERAGE

.PHONY: all clean fclean $(NAME) re debug tests_run
