resource "aws_iam_user" "activity2" {
  name = "activity2"
  tags = {
    tag-key = "activity2"
  }
   
}
resource "aws_iam_access_key" "activity2" {
    user = "activity2"
  
}


