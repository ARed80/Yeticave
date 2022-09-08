<?php

/**
 * Форматирует цену.
 * @param float $price - изначальная цена
 * @return string - отформатированная цена со знаком рубля "₽" 
 */

function format_price($price)
{
    $price = number_format($price, 0, '.', ' ');
    return "$price ₽";
}
