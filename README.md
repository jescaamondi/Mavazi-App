# Mavazi

A Flutter shopping app with real login, automatic sign-in on restart, and a shopping cart that keeps a running total in Kenyan shillings.

<!-- Add screenshots here, for example:
![Login](docs/login.png) ![Home](docs/home.png) ![Cart](docs/cart.png)
-->

## Features

- **Login against a real API.** Users sign in through the [DummyJSON](https://dummyjson.com/docs/auth) auth API. Wrong details show a clear error message.
- **Stays signed in.** The access and refresh tokens are saved on the device. When the app opens, it checks the saved token. If the token has expired, the app refreshes it automatically, and only asks the user to log in again if that also fails.
- **Product list** with images, names and prices.
- **Shopping cart.** Add products, change quantities, and see the total in KES update in the app bar.
- **Profile** showing the signed-in user's photo, name and email, with a log out button.
- **Sign-up form** with field validation. The registration call is not connected yet.

## How it is built

The app follows a simple MVVM structure with [Provider](https://pub.dev/packages/provider) for state:

```
lib/
├── models/       User, Product, Cart, CartItem, TokenResponse, LoginResults, ApiError
├── services/     AuthApi: login, fetch current user, refresh token
├── viewmodel/    AuthViewModel: login, auto-login, token storage, logout
└── screens/      Login, sign-up, home tabs, product and cart cards, Redirect
```

`Redirect` watches the login state and shows a loading spinner while the app checks the saved token, then the login screen or the home screen. Logging in or out switches screens automatically.

| Package | Used for |
| --- | --- |
| `provider` | App state for the cart and login |
| `http` | Calls to the auth API |
| `shared_preferences` | Saving the tokens on the device |

## Run it

```bash
flutter pub get
flutter run
```

To try the login, use a DummyJSON test account, for example username `emilys` and password `emilyspass`.

```bash
flutter test
```

## Next steps

- Connect the sign-up form to a registration endpoint.
- Load products from an API instead of local sample data.
- Build the Orders tab.