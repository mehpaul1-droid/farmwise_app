from PIL import Image, ImageDraw
import os

os.makedirs("assets", exist_ok=True)

img = Image.new("RGBA", (512, 512), (27, 94, 32))
draw = ImageDraw.Draw(img)

# Background circle
draw.ellipse((60, 60, 452, 452), fill=(46, 125, 50))

# Leaf shape (simple farm AI icon)
draw.polygon([(256,120),(330,260),(256,420),(182,260)], fill=(200, 255, 200))

# center line
draw.line((256,120,256,420), fill=(255,255,255), width=8)

img.save("assets/icon.png")

print("ICON CREATED SUCCESSFULLY")
