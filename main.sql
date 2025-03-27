CREATE DATABASE blog_app;

CREATE TABLE users (
    user_id  SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into users (first_name, last_name, email, password, phone_number, address) values
 ('Nicholas', 'Parkes', 'nparkes0@yelp.com', 'lZ3(z+i<rleIYiq', '100-592-9857', 'Apt 413'),
 ('Lolita', 'Dinan', 'ldinan1@cbslocal.com', 'yZ9/b6Es.Vl', '470-691-1602', '18th Floor'),
 ('Napoleon', 'Yushankin', 'nyushankin2@uiuc.edu', 'fK2_ih,&74S~p', '641-885-2802', 'PO Box 80037'),
 ('Eileen', 'Caines', 'ecaines3@gizmodo.com', 'yN0+3L)zM7', '580-161-8595', 'Apt 111'),
 ('Bevin', 'Obin', 'bobin4@mozilla.org', 'eW6{"Q=\dJW', '693-718-8359', '15th Floor'),
 ('Eugene', 'Whatman', 'ewhatman5@yellowpages.com', 'sD1*YuVqH`*o5', '582-334-1172', 'Apt 75'),
 ('Dominga', 'Hupka', 'dhupka6@plala.or.jp', 'nG4_!7P%"hZUoPH', '700-340-2978', '14th Floor'),
 ('Lutero', 'Witherspoon', 'lwitherspoon7@gizmodo.com', 'nS2#+u`(Jd0sG', '119-840-4334', 'Room 1154'),
 ('Son', 'Few', 'sfew8@mapquest.com', 'oT3=#K%(?EU@nezd', '282-708-7412', 'Suite 83'),
 ('Jarid', 'McLaverty', 'jmclaverty9@thetimes.co.uk', 'zG5%zMJz*|', '896-834-1009', 'PO Box 43990');

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    slug VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    auther_id INT NOT NULL,
    FOREIGN KEY (auther_id) REFERENCES users(user_id)
);

INSERT INTO posts(title, content, slug, auther_id) VALUES
('The best way to learn programming', 'The best way to learn programmie projects.', 'the-best-way-to-learn-programming', 1),
('How to become a software engineer', 'To become a software engineer, he basicss.', 'how-to-become-a-software-engineer', 2),
('The future of programming', 'The future of programming is bright. Wir programmers.', 'the-future-of-programming', 3),
('The importance of coding', 'Coding is an essential skill in today''s', 'the-importance-of-coding', 4),
('The benefits of open source software', 'Open source software is freeration and innovation.', 'the-benefits-of-opere', 5),
('The role of a software engineer', 'A software engineer is responsiblbers to en', 'the-role-of-a-software-engineer', 6),
('The future of artificial intelligence', 'Artificial intelligence is rtation.', 'the-future-of-artificial-intelligence', 7),
('The impact of technology on society', 'Technology has had addressed.', 'the-impact-of-technology-on-society', 8),
('The rise of remote work', 'Remote work has become increasingly k from anywhere.', 'the-rise-of-remote-work', 9);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    auther_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (auther_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

INSERT INTO comments (content, auther_id, post_id) VALUES
('Great post!', 1, 1),
('I agree with you.', 2, 1),
('Nice article.', 3, 2),
('I learned a lot from this.', 4, 2),
('I''m looking forward to the next post.', 5, 3),
('Keep up the good work.', 6, 3),
('I''m excited to see what you write next.', 7, 4),
('I''m looking forward to reading more.', 8, 4),
('I''m excited to see what you write next.', 9, 5),
('I''m looking forward to reading more.', 10, 5);


SELECT users.first_name, users.last_name, posts.title, comments.content
FROM users
WHERE users.user_id = comments.auther_id