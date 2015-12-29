<?php
/*
upgrade_12p3.php - Database upgrades for users upgrading from 1.2p1
Copyright (C) 2006-2010 Stephen Lawrence Jr.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

global $pdo;

echo 'Updating user table<br />';
$query = "ALTER TABLE user ADD pw_reset_code CHAR(32) default NULL";
$stmt = $pdo->prepare($query);
$stmt->execute();
