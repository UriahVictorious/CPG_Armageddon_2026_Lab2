#!/bin/bash

echo "Starting instance setup: update + install httpd"

# 1. Update system and install Apache
yum update -y
yum install -y httpd

# 2. Start and enable Apache web server
systemctl start httpd
systemctl enable httpd

# 3. Create the web content
mkdir -p /var/www/html
# Use a quoted heredoc to avoid accidental variable expansion
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cloud Automation Lab</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #A5d8D6; /* Background Color Requirement */
            margin: 0;
            padding: 0;
            color: #333;
        }
        header {
            background-color: #3F4E4F;
            color: white;
            padding: 2rem;
            text-align: center;
            }
            section {
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        footer {
            text-align: center;
            padding: 20px;
            font-size: 1rem;
            color: #666;
        }
    </style>
</head>
<body>

    <header>
        <h1>Vincent Woods -aka- Uriah Victorious</h1>
    </header>

    <!-- Section 1: About Me -->
    <section>
        <h2>About Me</h2>
        <p>I'm learning cloud computing and dev ops so I can escape the Matrix, Keisha, and the Kaos Goblins! Lol!</p>
        <!-- Embedded Image Requirement -->
        <img src="https://images.stockcake.com/public/c/a/0/ca0c7022-cf64-4996-be70-7d6072651bb5_large/watching-city-burn-stockcake.jpg" alt="Cloud Technology">
    </section>

    <!-- Section 2: Project Description -->
    <section>
        <h2>Project Description</h2>
        <p>This page was deployed using an EC2 User Data script. The script installs the Apache server, configures the service, and generates this HTML file without any manual SSH intervention.</p>
    </section>

    <!-- Section 3: Contact / Footer -->
    <footer>
        <h3>Contact</h3>
        <p>Email: uriahvictorious@gmail.com | CPG Armageddon Lab 2</p>
    </footer>

</body>
</html>
EOF

# 4. Set appropriate permissions for the web directory
shown -R apache:apache /var/www/html
chmod -R 755 /var/www/html