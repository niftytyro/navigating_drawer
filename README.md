# navigating_drawer

A Flutter Package to enable navigating inside drawers easy.

![navigating_drawer](https://user-images.githubusercontent.com/56196911/94339900-41069700-001b-11eb-814d-03f9d330d85a.gif)

## Usage

```dart
drawer: NavigatingDrawer(
  body: NavigatingDrawerList(
    children: [
      NavigatingDrawerListItem(
        title: Text('Item 1'),
        pushPage: NavigatingDrawerPage(
          body: NavigatingDrawerList(
            children: [
              NavigatingDrawerListItem(
                title: Text('SubItem 1'),
              ),
              NavigatingDrawerListItem(
                title: Text('SubItem 2'),
              ),
              NavigatingDrawerListItem(
                title: Text('SubItem 3'),
              ),
            ],
          ),
        ),
      ),
      NavigatingDrawerListItem(
        title: Text('Item 2'),
      ),
      NavigatingDrawerListItem(
        title: Text('Item 3'),
      ),
    ],
  ),
),
```
