from PIL import Image
import sys
import numpy as np
from scipy import spatial
import time

def palette_divisors_of_255(n):
	assert n < 255
	step = 255//n
	values = []
	current_value = 0
	while current_value < 255:
		values.append(current_value)
		current_value+=step

	values.append(255)
	palette = []
	for r in values:
		for g in values:
			for b in values:
				palette.append([r,g,b]) #assume no transparency

	return palette

palette = palette_divisors_of_255(int(sys.argv[3]))

tree = spatial.KDTree(palette)

def find_closest_palette_color(pixel):
	return palette[ tree.query(pixel)[1] ]

image = Image.open(sys.argv[1])
image_data = np.asarray(image)
print(f"image shape: {image_data.shape}")
print(f"palette size: {len(palette)}")

start = time.time()
for i in range(image_data.shape[0]):
	for j in range(image_data.shape[1]):
		oldpixel = image_data[i][j]
		newpixel = find_closest_palette_color(oldpixel[:3])
		image_data[i][j][:3] = newpixel
		
		if oldpixel.shape[0] < 4 or oldpixel[3] > 0:
			quant_error = oldpixel[:3] - newpixel
			quant_error = quant_error/16
			j_not_out_of_bounds = (j < image_data.shape[1] -1)
			if i < image_data.shape[0] -1:
				image_data[i + 1][j    ][:3] = image_data[i + 1][j    ][:3] + quant_error * 5 #
				if j > 0:
					image_data[i + 1][j - 1][:3] = image_data[i + 1][j - 1][:3] + quant_error * 3 
				if j_not_out_of_bounds:
					image_data[i + 1][j + 1][:3] = image_data[i + 1][j + 1][:3] + quant_error #
			if j_not_out_of_bounds:
				image_data[i    ][j + 1][:3] = image_data[i    ][j + 1][:3] + quant_error * 7 #

		
end = time.time()	
old_image = np.asarray(image)

print(np.sqrt(np.mean((old_image-image_data)**2)))
print(f"time: {end - start} seconds.")
output_image = Image.fromarray(image_data)
output_image.save(sys.argv[2])
