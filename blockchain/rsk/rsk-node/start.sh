sed -i s/localhost/$(hostname -i)/g app.json |sed -i s/instance_name/$(hostname)/g
