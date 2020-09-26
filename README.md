# navigating_drawer

A Flutter Package to enable navigating inside drawers easy.

![Alt Text](https://drive.google.com/file/d/1e0IsHvb1rzlZamfASIlg1Y76DjoHrS79/view)

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
