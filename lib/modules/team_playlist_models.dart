class TeamPlaylistPreViewListDto {
  final List<TeamPlaylistPreViewDto> teamPlaylistPreviewList;

  TeamPlaylistPreViewListDto({
    required this.teamPlaylistPreviewList,
  });

  factory TeamPlaylistPreViewListDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistPreViewListDto(
        teamPlaylistPreviewList: (json['teamPlaylistPreviewList'] as List)
            .map((i) => TeamPlaylistPreViewDto.fromJson(i))
            .toList()
    );
  }

  Map<String, dynamic> toJson() => {
    'teamPlaylistPreviewList': teamPlaylistPreviewList.map((dto) => dto.toJson()).toList(),
  };
}

class TeamPlaylistPreViewDto {
  final int teamPlaylistId;
  final String name;
  final DateTime createdDate;

  TeamPlaylistPreViewDto({
    required this.teamPlaylistId,
    required this.name,
    required this.createdDate,
  });

  factory TeamPlaylistPreViewDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistPreViewDto(
      teamPlaylistId: json['teamPlaylistId'],
      name: json['name'],
      createdDate: DateTime.parse(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() => {
    'teamPlaylistId': teamPlaylistId,
    'name': name,
    'createdDate': createdDate.toIso8601String(),
  };
}

class TeamPlaylistMusicListDto {
  final List<TeamPlaylistMusicDto> musicList;

  TeamPlaylistMusicListDto({
    required this.musicList
  });

  factory TeamPlaylistMusicListDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistMusicListDto(
        musicList: (json['musicList'] as List)
            .map((i) => TeamPlaylistMusicDto.fromJson(i))
            .toList()
    );
  }

  Map<String, dynamic> toJson() => {
    'musicList': musicList.map((dto) => dto.toJson()).toList(),
  };
}

class TeamPlaylistMusicDto {
  final int teamPlaylistMusicMappingId;
  final int musicId;
  final String title;
  final String artist;
  final String url;
  final int musicOrder;
  final String thumbnail;

  TeamPlaylistMusicDto({
    required this.teamPlaylistMusicMappingId,
    required this.musicId,
    required this.title,
    required this.artist,
    required this.url,
    required this.musicOrder,
    required this.thumbnail,
  });

  factory TeamPlaylistMusicDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistMusicDto(
      teamPlaylistMusicMappingId: json['teamPlaylistMusicMappingId'] ?? 0,
      musicId: json['musicId'] ?? 0,
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      url: json['url'] ?? '',
      musicOrder: json['musicOrder'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'teamPlaylistMusicMappingId': teamPlaylistMusicMappingId,
    'musicId': musicId,
    'title': title,
    'artist': artist,
    'url': url,
    'musicOrder': musicOrder,
    'thumbnail': thumbnail,
  };

  TeamPlaylistMusicDto copyWith({
    int? teamPlaylistMusicMappingId,
    int? musicId,
    String? title,
    String? artist,
    String? url,
    int? musicOrder,
    String? thumbnail,
  }) {
    return TeamPlaylistMusicDto(
      teamPlaylistMusicMappingId: teamPlaylistMusicMappingId ?? this.teamPlaylistMusicMappingId,
      musicId: musicId ?? this.musicId,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      url: url ?? this.url,
      musicOrder: musicOrder ?? this.musicOrder,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}

class TeamPlaylistDetailDto {
  final int teamPlaylistId;
  final String name;
  final DateTime createdDate;
  final List<TeamPlaylistMusicDto> teamPlaylistMusicList;

  TeamPlaylistDetailDto({
    required this.teamPlaylistId,
    required this.name,
    required this.createdDate,
    required this.teamPlaylistMusicList,
  });

  factory TeamPlaylistDetailDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistDetailDto(
      teamPlaylistId: json['playlistId'],
      name: json['name'],
      createdDate: DateTime.parse(json['createdDate']),
      teamPlaylistMusicList: (json['playlistMusicList'] as List)
          .map((music) => TeamPlaylistMusicDto.fromJson(music))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'playlistId': teamPlaylistId,
    'name': name,
    'createdDate': createdDate.toIso8601String(),
    'playlistMusicList': teamPlaylistMusicList.map((dto) => dto.toJson()).toList(),
  };
}

class TeamPlaylistMemberDto {
  final int memberId;
  final String name;
  final String email;
  final String role;  // ADMIN or MEMBER

  TeamPlaylistMemberDto({
    required this.memberId,
    required this.name,
    required this.email,
    required this.role,
  });

  // role을 기준으로 isAdmin getter 추가
  bool get isAdmin => role == 'ADMIN';

  factory TeamPlaylistMemberDto.fromJson(Map<String, dynamic> json) {
    return TeamPlaylistMemberDto(
      memberId: json['memberId'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}