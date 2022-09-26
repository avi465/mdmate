#! /bin/bash
logo="
███    ███ ██████  ███    ███  █████  ████████ ███████ 
████  ████ ██   ██ ████  ████ ██   ██    ██    ██      
██ ████ ██ ██   ██ ██ ████ ██ ███████    ██    █████   
██  ██  ██ ██   ██ ██  ██  ██ ██   ██    ██    ██      
██      ██ ██████  ██      ██ ██   ██    ██    ███████ 

------------------------------------------------------                                                       
created by avinash
version 1.0
https://www.github.com/avi465
------------------------------------------------------ 
"
echo -e "$logo"

file_name=$1
touch $file_name

if [ -z "$file_name" ]; then
  echo -e "\nmd: missing file name\nTry 'md file_name.md' for running command.\n"
  exit 1
fi

read -p "Do you want to use json file?(y/n): " answer
if [ "$answer" = "y" ]; then
  echo "Searching for file..."
  file_path=$(pwd)
  echo "Scanning in $file_path path..."
  file=$(find $file_path -name "package.json")
  if [ -z "$file" ]; then
    echo -e "file not found!\n"
  else
    echo "Parshing json file..."
    echo -e "This feature is still under development...\n"
  fi
fi

read -p "Enter logo url?: " logo_url
read -p "Enter title?: " title
read -p "Enter description?: " description
read -p "Enter repo url?: " repo_url
read -p "Enter github username?: " username
read -p "Enter repo name?: " repo_name
read -p "Enter screenshot url?: " screenshot
read -p "Enter demo url?: " domo_url
read -p "Enter Author?: " author

img_shield_endpoint='https://img.shields.io/github'
stack_icon_endpoint='https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills'
back_to_top='<p align="right">(<a href="#top">back to top</a>)</p>'

# writing in file
cat <<-EOF >>$file_name
<div id="top"></div>

<div align="center">
EOF

if [ ! -z "$logo_url" ]; then
  cat <<-EOF >>$file_name
  <img src="$logo_url" width="120px">
  <h2>$title</h2>
  $(read -p "Enter subtitle?: " subtitle)
  <p>$subtitle</p>
EOF
fi

if [ ! -z "$repo_url" ]; then
  cat <<-EOF >>$file_name
  <img alt="GitHub Repo stars" src="$img_shield_endpoint/stars/$username/$repo_name?style=flat">
  <img alt="contributors" src="$img_shield_endpoint/contributors/$username/$repo_name?style=flat">
  <img alt="GitHub Repo forks" src="$img_shield_endpoint/forks/$username/$repo_name?style=flat">
  <img alt="issues" src="$img_shield_endpoint/issues/$username/$repo_name?style=flat"> </br>
EOF
fi

cat <<-EOF >>$file_name
</div>

# $title

$description

<p align="$left">
  <a href="$repo_url/issues/new?assignees=&labels=bug&template=bug_report.md&title=">View Demo</a>
  ·
  <a href="$repo_url/issues/new?assignees=&labels=bug&template=bug.yml&title=%5BBUG%5D+%3Cdescription%3E">Report Bug</a>
  ·
  <a href="$repo_url/issues/new?assignees=&labels=feature&template=features.yml&title=%5BFEATURE%5D+%3Cdescription%3E">Request Feature</a>
</p>
 
EOF

if [ ! -z "$screenshot" ]; then
  cat <<-EOF >>$file_name
  ### 🖼️ Screenshot

  ![image]($screenshot)

  $back_to_top

EOF
fi

cat <<-EOF >>$file_name
## 📚 Getting Started

To get a local copy up and running follow these simple steps.

\`\`\`bash
  git clone $repo_url
\`\`\`

### 👇🏽 Prerequisites

Before installation, please make sure you have already installed the following tools:

- [Git](https://git-scm.com/downloads)

## 🎨 Live demo

Check out the website: [$title]($demo_url)

$back_to_top

## 👩🏽‍💻 Contributing

- Contributions make the open source community such an amazing place to learn, inspire, and create.
- Any contributions you make are greatly appreciated.
- Check out our [contribution guidelines](/CONTRIBUTING.md) for more information.

$back_to_top

## 🛡️ License

Whisper is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

$back_to_top

## 💪🏽 Thanks to all Contributors

Thanks a lot for spending your time helping Whisper grow. Thanks a lot! Keep rocking🍻

[![Contributors](https://contrib.rocks/image?repo=$username/$repo_name)]($repo_url/graphs/contributors)

$back_to_top

## 🙏🏽 Support

If you like this project don't forget to leave a star🌟

$back_to_top

## ✍️Author

This project is made by [$author](https://www.github.com/$username)
EOF
