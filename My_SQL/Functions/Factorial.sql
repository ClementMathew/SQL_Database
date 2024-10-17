delimiter //

CREATE FUNCTION Faatorial(n INT)

RETURNS INT(11)
DETERMINISTIC

BEGIN

DECLARE factorial INT;
SET factorial = n ;

IF n <= 0 THEN
RETURN 1;
END IF;

facto: LOOP
SET n = n - 1 ;

IF n<1 THEN
LEAVE facto;
END IF;

SET factorial = factorial * n ;

END LOOP facto;

RETURN factorial;

END //

delimiter ;