DELIMITER $$

CREATE TRIGGER must_be_adult
    BEFORE INSERT ON people FOR EACH ROW
    BEGIN
        IF NEW.age < 18
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Must be an adult!';
        END IF;
    END;
    
$$

CREATE TRIGGER prevent_self_follows
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.follower_id = NEW.followee_id
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
        END IF;
    END;
$$

CREATE TRIGGER capture_unfollow
    AFTER DELETE ON follows FOR EACH ROW
    BEGIN
        INSERT INTO unfollows
        SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
    END;
$$
-- DROP TRIGGER ///// SHOW TRIGGER

DELIMITER ;

