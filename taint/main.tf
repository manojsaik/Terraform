provider "local" {
  
}

resource "local_file" "highman" {
  
  filename = "~/taint.txt"
  content = "this is a tainted content use carefully"
}