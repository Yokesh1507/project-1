from PIL import Image, ImageDraw, ImageFont
name="Suba"
course="Java"
grade="O"
rdate="02-03-2025"
fnn="suba_1.jpg"
###
# Load the image
image = Image.open("static/cert.jpg")

# Create a drawing object
draw = ImageDraw.Draw(image)

# Define text and font with size
font_size = 25  # Change this value to adjust font size
font = ImageFont.truetype("arial.ttf", font_size)

# Define text and position
text = name
position = (401,320) 
text_color = (0, 0, 0)  # color
draw.text(position, text, fill=text_color, font=font)

text = course
position = (440,431) 
text_color = (0, 0, 0)  # color
draw.text(position, text, fill=text_color, font=font)

text = grade
position = (309,564) 
text_color = (0, 0, 0)  # color
draw.text(position, text, fill=text_color, font=font)

text = rdate
position = (283,620) 
text_color = (0, 0, 0)  # color
draw.text(position, text, fill=text_color, font=font)

# Save and show the image
image.save("static/certificate/"+fnn)
