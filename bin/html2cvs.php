<?php
	function PurifyLinks($instr) {
		return preg_replace('/<a[^>]*>(.*)<\/a>/', '$1', $instr);

		if (strpos($instr, '<a') === FALSE) { return $instr; }
		else {
		  $links = explode('<a', $instr);
		  $result = 0;
		  foreach ($links as $link) {
		    $hrp = strpos($link, 'href="');
		    if ($hrp === FALSE) {
			  $sp = strpos($link, '>');
			  $ep = strpos($link, '</a>');
			  $result.= substr($link, $sp + 1, $ep - $sp - 1).substr($link, $ep + 4);
		    } else {
			  $pl = substr($link, $hrp + 6);
			  $ep = strpos($pl, '"');
			  $result.= substr($ep, $pl);
		    }
		  }
		  return $result;
		}

	}


	function ConvertTableToCsv($data, $separator) {
		$result = '';
		$data = preg_replace('/<(.+?)>/ies','strtolower("<\\1>")',$data); //Чтоб этому ослу ни дна ни кочерыжки. Переводит теги в верхний регистр :(  preg_replace('/(\w+)=([\w:\/-_.]+)/is','\\1="\\2"',$stringtagstolower);для XHTML
		$mydata = str_replace(
		  array('-<br>', '&nbsp;', '&shy;', '&SHY;', '&#8203;', '<br>','<br/>','<br />', 'mailto:', '<hr>', '<hr />', "\r", "\n", ';'),
		  array('',      ' ',      '',      '',      '',        ' ',   ' ',    ' ',      '',        ', ',    ', ',     ' ',  ' ', ' ' ),
		  $data);
		$rows = explode('<tr', $mydata);
		foreach ($rows as $row_num => $row) {
		  if ($row_num > 0) {
			$sp = strpos($row, '>');
			$ep = strpos($row, '</tr');
			$rp = trim(substr($row, $sp + 1, $ep - $sp - 1));
			$columns = explode('<t', $rp);
			foreach($columns as $column_num => $column) {
			  $sp = strpos($column, '>');
			  $ep = strpos($column, '</t');
			  $cell = PurifyLinks(trim(substr($column, $sp + 1, $ep - $sp - 1)));
			  if ($column_num > 1) {$result.= $separator;}
			  $result.= htmlspecialchars_decode(str_replace(array($separator,'	'), array(',', ' '), strip_tags($cell)));
			}
			$result.= "\r\n";
		  }
		}
		return $result;
	}

	header('Content-type: application/vnd.ms-excel; charset=utf-8');
	header("Content-Disposition: attachment; filename=out.csv");
	$separator = empty($_GET['separator']) ? '#' : $_GET['separator'];
	print ConvertTableToCsv(file_get_contents(dirname(__FILE__).'/in.html'), $separator);
	exit;
?>
