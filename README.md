# 🤖 Robot Builder V9

An interactive web application for building and customizing robots with real-time visual preview. Build your dream robot with extensive customization options and share configurations with others!

## 🌟 Features

### Core Customization
- **Head & Face**: Multiple shapes, sizes, colors, and expressions (smile, frown, flat)
- **Body**: Adjustable width, height, and colors
- **Arms**: 360° shoulder and elbow control with bending
- **Legs**: Knee joints with realistic bending mechanics
- **Neck**: Variable length and color

### Advanced Accessories
- **Combat**: Shoulder-mounted lasers, hand weapons
- **Tech**: Chest access panels, communication antennas, display screens
- **Utility**: Connecting wires, utility belts, various patterns
- **Classic**: Glasses, shoes (customizable colors), status lights

### Technology Stack
- **Frontend**: Pure HTML5, CSS3, JavaScript (ES6+)
- **Graphics**: HTML5 Canvas API for real-time rendering
- **Responsive**: Mobile-first design with touch-friendly controls
- **Sharing**: Base64 configuration encoding for easy sharing

### Mobile Features
- **Responsive Design**: Optimized for all screen sizes
- **Touch Controls**: Larger inputs and buttons on mobile
- **Collapsible Menus**: Organized control groups with smooth animations
- **Hamburger Menu**: Clean slide-in navigation for mobile

## 🚀 Live Demo

Visit the live application: **[robotbuilder.jackrea.co.uk](https://robotbuilder.jackrea.co.uk)**

## 📱 Usage

1. **Open the application** in any modern web browser
2. **Customize your robot** using the control panel:
   - Adjust physical properties (size, color, shape)
   - Configure joint angles for dynamic poses
   - Add accessories and equipment
3. **Share your creation** using the configuration string
4. **Load saved robots** by pasting configuration codes

### Mobile Usage
- Tap the **☰** menu button to access controls
- Use **collapsible sections** to organize customization options
- **Pinch to zoom** on the robot preview (where supported)

## 🏗️ Infrastructure

### AWS Architecture
```
robotbuilder.jackrea.co.uk (Route53)
           ↓
    CloudFront Distribution (SSL/CDN)
           ↓
       S3 Static Website
```

### Deployment Stack
- **S3**: Static website hosting
- **CloudFront**: Global CDN with caching
- **Route53**: DNS management
- **ACM**: Free SSL certificates
- **Terraform**: Infrastructure as Code

## 🛠️ Development

### Local Development
1. **Clone the repository:**
   ```bash
   git clone https://github.com/reaandrew/robotbuilder.git
   cd robotbuilder
   ```

2. **Open in browser:**
   ```bash
   # Open any version locally
   open robot-builder-v9.html
   ```

### Version History
- **V1**: Basic robot customization
- **V2**: Arm bending capabilities
- **V3**: 360° arm control, fixed left arm direction
- **V4**: Facial expressions (smile, frown, flat)
- **V5**: Neck control and shoe color customization
- **V6**: Advanced accessories and knee joints
- **V7**: Full-screen browser experience
- **V8**: Adaptive canvas and configuration sharing
- **V9**: Mobile responsiveness with collapsible menus

## 📦 Deployment

### Prerequisites
- AWS CLI configured
- Terraform >= 1.0
- Existing Route53 hosted zone for `jackrea.co.uk`

### Deploy to AWS
1. **Navigate to terraform directory:**
   ```bash
   cd terraform
   ```

2. **Initialize and apply:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Access your site:**
   - Website: `https://robotbuilder.jackrea.co.uk`
   - Deployment takes 5-15 minutes for DNS propagation

### State Management
- **Remote State**: Stored in S3 bucket `jackrea-co-uk-terraform-state`
- **Encryption**: Enabled with versioning
- **Locking**: Native Terraform S3 backend locking

## 🔧 Configuration

### Terraform Variables
```hcl
aws_region = "eu-west-2"
domain_name = "jackrea.co.uk"
subdomain = "robotbuilder.jackrea.co.uk"
```

### Robot Configuration Format
Robots are encoded as Base64 strings containing:
- Unique robot ID (UUID)
- All customization parameters
- Accessory configurations
- Joint positions and angles

## 🎨 Customization Examples

### Warrior Robot
- Large square head with frown expression
- Red body with shoulder lasers
- Bent arms holding weapons
- Utility belt with access panel

### Friendly Bot
- Round blue head with smile
- Yellow arms waving (360° positioning)
- Green legs with colorful shoes
- Status lights and antenna

### Stealth Unit
- Rectangular dark head with flat expression
- Black body with minimal accessories
- Straight posture, no extra equipment
- Wired connections visible

## 📊 Technical Details

### Canvas System
- **Resolution**: Scalable vector-based rendering
- **Performance**: Optimized drawing with efficient redraws
- **Responsive**: Maintains aspect ratio across devices

### State Management
- **Real-time Updates**: Immediate visual feedback
- **Configuration Sync**: Automatic encoding/decoding
- **Event Handling**: Efficient DOM listeners

### Mobile Optimization
- **Touch Targets**: Minimum 44px touch areas
- **Viewport**: Responsive meta tag configuration
- **Performance**: Optimized for mobile browsers

## 🔐 Security Features

- ✅ HTTPS enforced (HTTP redirects)
- ✅ TLS 1.2+ minimum protocol
- ✅ CloudFront Origin Access Control
- ✅ S3 bucket access restrictions
- ✅ No server-side vulnerabilities (static site)

## 💰 Cost Estimation

Monthly AWS costs (low traffic):
- S3 hosting: ~$0.50
- CloudFront: ~$1.00
- Route53: ~$0.50
- ACM certificate: Free
- **Total: ~$2.00/month**

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test across devices
5. Submit a pull request

## 📄 License

This project is open source. Feel free to use, modify, and distribute.

## 🙏 Acknowledgments

- Built with ❤️ using modern web technologies
- Deployed on AWS with Terraform
- Mobile-first responsive design principles

---

**🤖 Generated with [Claude Code](https://claude.ai/code)**