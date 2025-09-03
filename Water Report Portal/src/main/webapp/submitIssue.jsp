<!DOCTYPE html>
<html>
<head>
    <title>Report Water Quality Issue</title>
</head>
<body>
<h2>Submit Water Issue</h2>
<form action="submitIssue" method="post" enctype="multipart/form-data">
    Name: <input type="text" name="name" required><br><br>
    Location: <input type="text" name="location" required><br><br>
    Description: <textarea name="description" required></textarea><br><br>
    Upload Image: <input type="file" name="image"><br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
