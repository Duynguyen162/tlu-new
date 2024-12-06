<?php
class Database {
    private $host = "localhost"; // Địa chỉ máy chủ
    private $db_name = "tlunews"; // Tên cơ sở dữ liệu
    private $username = "root"; // Tên người dùng MySQL
    private $password = "123456789"; // Mật khẩu của MySQL
    public $conn;

    // Hàm kết nối cơ sở dữ liệu
    public function getConnection() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch (PDOException $exception) {
            echo "Lỗi kết nối: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
?>
