class GroupTile{
  final String title;
  final List<GroupTile> tiles;

  const GroupTile({
    required this.title,
    this.tiles = const []
});
}

final groupTile = <GroupTile>[
  const GroupTile(title: 'Groups',
  tiles: [GroupTile(title: 'Group 1')]
  )
];