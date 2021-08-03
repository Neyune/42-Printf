# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ereali <ereali@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/31 21:08:34 by ereali            #+#    #+#              #
#    Updated: 2021/06/10 16:19:57 by ereali           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		libftprintf.a

INC_DIR = 	$(shell find includes -type d)

INC_LIBFT = libft/
LIB = libft/libft.a

##List every folder where he will find source file
SRC_DIR = 	$(shell find srcs -type d)

##Folder where he will store the .o
OBJ_DIR	=	obj

##Add to the vpath the folder find in SRC_DIR
vpath %.c $(foreach dir, $(SRC_DIR), $(dir):)

##List every .c found inside SRC_DIR
SRC =	ft_atoi.c ft_isdigit.c ft_itoa_base.c ft_uitoa_base.c ft_str_basic.c \
		ft_str_basic2.c ft_str_toupper.c\
		ft_str_basic3.c ft_target_strncat.c ft_toupper.c converter.c \
		converter2.c converter3.c handle_converter.c set_flags_lh.c \
		set_flags.c t_data.c t_flag_data.c flag.c flag2.c handle_flag.c \
		ft_printf.c \

##Transform and place every .o from SRC
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:%.c=%.o))

##Basics flags
CFLAGS =	-Wall -Wextra -Werror

##Create the flags to includes every .h needed by this program
IFLAGS =	$(foreach dir, $(INC_DIR), -I$(dir))

##Define the compiler to use
CC =			gcc

all: $(NAME)

$(NAME):
				make -C
				$(OBJ) $(INC_DIR) Makefile
				@echo "Compiling $(NAME) ...\c"
				@ar rc $(NAME) $(OBJ)
				@ranlib $(NAME)
				@echo " DONE"

$(OBJ_DIR)/%.o : %.c
				@mkdir -p $(OBJ_DIR)
				@echo "Compiling $< ...\c"
				@$(CC) $(CFLAGS) $(IFLAGS) -o $@ -c $<
				@echo " DONE"

bonus:
				make re

debug:			$(NAME)
				$(CC) $(CFLAGS) $(IFLAGS) -L . -l ftprintf main.c
				./a.out

clean:
				@rm -rf $(OBJ_DIR)
				@echo "clean"

fclean:			clean
				@rm -f $(NAME)
				@echo "fclean"

re:				fclean all

.PHONY: all clean fclean re
