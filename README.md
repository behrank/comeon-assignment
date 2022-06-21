# Casino Games App

This repository contains web and iOS apps for Comeon group assignment.

## Installation

Web app:
Please install ngrok before running both applications. 
Ngrok -> https://ngrok.com/

Then run following command on terminal

```bash
ngrok config add-authtoken 2ArHG5PjuhdMat8wzE3ZcwnPIyB_FfufkRCuRATjDCn5zARR
```
iOS app:
Download Xcode from Mac AppStore.

## Usage

### Web App
Go to project web application folder on terminal. Run following commands for starting web application and tunneling for iOS application.

```bash
npm install
```
```bash
npm start
```

```bash
ngrok http 3000
```
### iOS App

Open CasinoGames.xcodeproj from 'Native' folder. Start the app for any simulator device.

### Notes
iOS App:
I couldnt bypass ngrok security issue via adding header info on URLRequest for WKWebView. Their instructions not working. I added a javascript workaround for it. 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
