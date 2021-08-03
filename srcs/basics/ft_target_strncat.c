/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_target_strncat.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ereali <ereali@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/31 21:04:55 by ereali            #+#    #+#             */
/*   Updated: 2020/01/31 21:04:58 by ereali           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	ft_target_strncat(char *s1, char *s2, size_t start, size_t len)
{
	size_t	i;
	size_t	j;

	i = start;
	j = 0;
	while (j < len)
	{
		s1[i + j] = s2[j];
		j++;
	}
	s1[i + j] = '\0';
}
