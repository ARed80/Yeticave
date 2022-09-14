<?php

/**
 * Форматирует цену.
 * @param float $price - изначальная цена
 * @return string - отформатированная цена со знаком рубля "₽" 
 */

function format_price($price)
{
    $price = ceil($price);
    $price = number_format($price, 0, '.', ' ');
    return "$price ₽";
}

/**
 * Вычисляет оставщееся время до окончания торгов для лота в формате ЧЧ ММ
 * @param string $end_date - дата окончания торгов для лота
 * @return array - массив, в котором первое число - это количество часов, а второе - это количество минут
 */
function time_left($end_date)
{
    $cur_time = strtotime('now');
    $end_date = strtotime($end_date);

    $time_left = $end_date - $cur_time;
    $hours_left = floor($time_left / 3600);

    $time_left = $time_left - $hours_left * 3600;
    $minutes_left = floor($time_left / 60);

    $hours_left = str_pad($hours_left, 2, "0", STR_PAD_LEFT);
    $minutes_left = str_pad($minutes_left, 2, "0", STR_PAD_LEFT);

    $result[] = $hours_left;
    $result[] = $minutes_left;
        
    return $result;
    
}