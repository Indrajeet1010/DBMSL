use lab;

CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PublishYear INT
);

CREATE TABLE LibraryAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(10),  -- 'UPDATE' or 'DELETE'
    BookID INT,
    OldTitle VARCHAR(255),
    OldAuthor VARCHAR(255),
    OldPublishYear INT,
    AuditTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER Before_Delete_Library
BEFORE DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO LibraryAudit (Action, BookID, OldTitle, OldAuthor, OldPublishYear)
    VALUES ('DELETE', OLD.BookID, OLD.Title, OLD.Author, OLD.PublishYear);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER After_Update_Library
AFTER UPDATE ON Library
FOR EACH ROW
BEGIN
    IF OLD.Title <> NEW.Title OR OLD.Author <> NEW.Author OR OLD.PublishYear <> NEW.PublishYear THEN
        INSERT INTO LibraryAudit (Action, BookID, OldTitle, OldAuthor, OldPublishYear)
        VALUES ('UPDATE', OLD.BookID, OLD.Title, OLD.Author, OLD.PublishYear);
    END IF;
END;
//
DELIMITER ;
