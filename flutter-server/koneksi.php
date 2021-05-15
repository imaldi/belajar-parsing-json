<?php
$connect = new mysqli("localhost","root", "", "mentoring");
if ($connect) {
} else {
echo "database error";
}
?>