resource "local_file" "hello" {
  content  = var.message
  filename = "${path.module}/hello.txt"
}
# testing github actions