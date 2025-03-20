-- Create Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Users Data
INSERT INTO users (name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '234-567-8901'),
('Charlie Brown', 'charlie@example.com', '345-678-9012'),
('David White', 'david@example.com', '456-789-0123'),
('Emma Green', 'emma@example.com', '567-890-1234'),
('Frank Black', 'frank@example.com', '678-901-2345'),
('Grace Adams', 'grace@example.com', '789-012-3456'),
('Hank Miller', 'hank@example.com', '890-123-4567'),
('Ivy Wilson', 'ivy@example.com', '901-234-5678'),
('Jack Taylor', 'jack@example.com', '012-345-6789');

-- Create Events Table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    event_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Events Data
INSERT INTO events (title, description, location, event_date) VALUES
('Tech Conference 2025', 'Annual technology conference.', 'New York', '2025-05-20 09:00:00'),
('Music Festival', 'Outdoor live music event.', 'Los Angeles', '2025-06-15 18:00:00'),
('Startup Meetup', 'Networking for entrepreneurs.', 'San Francisco', '2025-07-10 14:00:00'),
('AI Workshop', 'Hands-on AI training.', 'Boston', '2025-08-05 10:00:00'),
('Cybersecurity Summit', 'Latest in cybersecurity.', 'Chicago', '2025-09-12 11:00:00'),
('Art Exhibition', 'Modern art showcase.', 'Miami', '2025-10-03 17:00:00'),
('Film Screening', 'Exclusive movie premiere.', 'Seattle', '2025-11-08 19:00:00'),
('Health & Wellness Expo', 'Fitness and health trends.', 'Houston', '2025-12-01 09:00:00'),
('Gaming Convention', 'Esports and gaming industry event.', 'Las Vegas', '2026-01-20 15:00:00'),
('Business Forum', 'Corporate networking event.', 'Washington D.C.', '2026-02-10 13:00:00');

-- Create Attendees Table (Many-to-Many Relationship with Composite Primary Key)
CREATE TABLE attendees (
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, event_id),  -- Composite primary key
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE
);

-- Insert Attendees Data (Assign Users to Events)
INSERT INTO attendees (user_id, event_id) VALUES
(1, 1), (1, 3), (1, 5),
(2, 2), (2, 4), (2, 6),
(3, 3), (3, 7), (3, 9),
(4, 1), (4, 4), (4, 8),
(5, 2), (5, 5), (5, 10),
(6, 6), (6, 7), (6, 9),
(7, 1), (7, 3), (7, 10),
(8, 2), (8, 5), (8, 6),
(9, 4), (9, 8), (9, 9),
(10, 3), (10, 7), (10, 10);
