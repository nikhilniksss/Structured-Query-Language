You are given a table logins containing IP addresses as plain text strings.
Each row represents an IP address from a user login attempt. Your task is to validate whether the IP address is a valid IPv4 address or not based on the following criteria:


1- The IP address must contain exactly 4 parts, separated by 3 dots (.).
2- Each part must consist of only numeric digits (no letters or special characters).
3- Each numeric part must be within the inclusive range of 0 to 255.
4- No part should contain leading zeros unless the value is exactly 0.

 

Table: logins
+-------------+----------+
| COLUMN_NAME | DATA_TYPE|
+-------------+----------+
| ip_address  | VARCHAR  |
+-------------+----------+
Hints
Expected Output
+-----------------+----------+
| ip_address      | is_valid |
+-----------------+----------+
| 192.168.1.1     |        1 |
| 255.255.255.255 |        1 |
| 0.0.0.0         |        1 |
| 256.100.0.1     |        0 |
| 192.168.01.1    |        0 |
| 10.10.10        |        0 |
| abc.def.ghi.jkl |        0 |
| 1.2.3.4         |        1 |
| 172.016.254.1   |        0 |
| 192.168.1.300   |        0 |
| 123.045.067.089 |        0 |
| 127.0.0.10      |        1 |
+-----------------+----------+

solution:

SELECT
  ip_address,
  REGEXP_LIKE(
    TRIM(ip_address),
    '^(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)){3}$'
  ) AS is_valid
FROM logins;