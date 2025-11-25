-- init.sql
-- Thêm các lệnh SQL khởi tạo cơ sở dữ liệu ở đây.
-- Ví dụ: tạo bảng và chèn dữ liệu mẫu.

CREATE TABLE IF NOT EXISTS example_table (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	created_at TIMESTAMPTZ DEFAULT now()
);

INSERT INTO example_table (name) VALUES ('initial row');

-- Kết thúc init.sql
