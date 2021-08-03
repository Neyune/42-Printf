/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   converter3.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ereali <ereali@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/31 21:05:59 by ereali            #+#    #+#             */
/*   Updated: 2020/02/05 17:13:45 by ereali           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	converter_percent(t_data *data, t_flag_data *flag_data)
{
	char	*str;

	handle_wildcard(data, flag_data);
	str = ft_strdup("%");
	handle_padding(flag_data, &str);
	add_str_to_buffer(data, str);
	free(str);
}

void	converter_other(t_data *data, t_flag_data *flag_data, char c)
{
	char	str[2];

	(void)flag_data;
	str[0] = c;
	str[1] = '\0';
	add_str_to_buffer(data, str);
}

void	converter_s(t_data *data, t_flag_data *flag_data)
{
	char	*str;
	char	*str2;

	handle_wildcard(data, flag_data);
	str = va_arg(data->arg, char *);
	if (str == NULL)
		str2 = ft_strdup("(null)");
	else
		str2 = ft_strdup(str);
	if ((ft_strlen(str2) > (size_t)(flag_data->precision))
			&& flag_data->point == TRUE)
		str2[(size_t)(flag_data->precision)] = '\0';
	handle_padding(flag_data, &str2);
	add_str_to_buffer(data, str2);
	free(str2);
}
