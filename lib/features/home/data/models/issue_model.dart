import 'dart:convert';

class IssueModelResponse {
  final int totalCount;
  final bool incompleteResults;
  final List<IssueModel> items;

  IssueModelResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory IssueModelResponse.fromRawJson(String str) =>
      IssueModelResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueModelResponse.fromJson(Map<String, dynamic> json) =>
      IssueModelResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<IssueModel>.from(
            json["items"].map((x) => IssueModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class IssueModel {
  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final User user;
  final List<Label> labels;
  final State state;
  final bool locked;
  final User? assignee;
  final List<User> assignees;
  final dynamic milestone;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic closedAt;
  final AuthorAssociation authorAssociation;
  final dynamic activeLockReason;
  final String? body;
  final Reactions reactions;
  final String timelineUrl;
  final dynamic performedViaGithubApp;
  final dynamic stateReason;
  final double score;
  final bool? draft;
  final PullRequest? pullRequest;

  IssueModel({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignee,
    required this.assignees,
    required this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.authorAssociation,
    required this.activeLockReason,
    required this.body,
    required this.reactions,
    required this.timelineUrl,
    required this.performedViaGithubApp,
    required this.stateReason,
    required this.score,
    this.draft,
    this.pullRequest,
  });

  factory IssueModel.fromRawJson(String str) =>
      IssueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
        url: json["url"],
        repositoryUrl: json["repository_url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        user: User.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: stateValues.map[json["state"]]!,
        locked: json["locked"],
        assignee:
            json["assignee"] == null ? null : User.fromJson(json["assignee"]),
        assignees:
            List<User>.from(json["assignees"].map((x) => User.fromJson(x))),
        milestone: json["milestone"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"],
        authorAssociation:
            authorAssociationValues.map[json["author_association"]]!,
        activeLockReason: json["active_lock_reason"],
        body: json["body"],
        reactions: Reactions.fromJson(json["reactions"]),
        timelineUrl: json["timeline_url"],
        performedViaGithubApp: json["performed_via_github_app"],
        stateReason: json["state_reason"],
        score: json["score"],
        draft: json["draft"],
        pullRequest: json["pull_request"] == null
            ? null
            : PullRequest.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "repository_url": repositoryUrl,
        "labels_url": labelsUrl,
        "comments_url": commentsUrl,
        "events_url": eventsUrl,
        "html_url": htmlUrl,
        "id": id,
        "node_id": nodeId,
        "number": number,
        "title": title,
        "user": user.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": stateValues.reverse[state],
        "locked": locked,
        "assignee": assignee?.toJson(),
        "assignees": List<dynamic>.from(assignees.map((x) => x.toJson())),
        "milestone": milestone,
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "closed_at": closedAt,
        "author_association":
            authorAssociationValues.reverse[authorAssociation],
        "active_lock_reason": activeLockReason,
        "body": body,
        "reactions": reactions.toJson(),
        "timeline_url": timelineUrl,
        "performed_via_github_app": performedViaGithubApp,
        "state_reason": stateReason,
        "score": score,
        "draft": draft,
        "pull_request": pullRequest?.toJson(),
      };
}

class User {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final Type type;
  final bool siteAdmin;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]]!,
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": typeValues.reverse[type],
        "site_admin": siteAdmin,
      };
}

enum Type { USER }

final typeValues = EnumValues({"User": Type.USER});

enum AuthorAssociation { COLLABORATOR, CONTRIBUTOR, MEMBER, NONE, OWNER }

final authorAssociationValues = EnumValues({
  "COLLABORATOR": AuthorAssociation.COLLABORATOR,
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "MEMBER": AuthorAssociation.MEMBER,
  "NONE": AuthorAssociation.NONE,
  "OWNER": AuthorAssociation.OWNER
});

class Label {
  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String color;
  final bool labelDefault;
  final String? description;

  Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.labelDefault,
    required this.description,
  });

  factory Label.fromRawJson(String str) => Label.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        name: json["name"],
        color: json["color"],
        labelDefault: json["default"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "url": url,
        "name": name,
        "color": color,
        "default": labelDefault,
        "description": description,
      };
}

class PullRequest {
  final String url;
  final String htmlUrl;
  final String diffUrl;
  final String patchUrl;
  final dynamic mergedAt;

  PullRequest({
    required this.url,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.mergedAt,
  });

  factory PullRequest.fromRawJson(String str) =>
      PullRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        url: json["url"],
        htmlUrl: json["html_url"],
        diffUrl: json["diff_url"],
        patchUrl: json["patch_url"],
        mergedAt: json["merged_at"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "diff_url": diffUrl,
        "patch_url": patchUrl,
        "merged_at": mergedAt,
      };
}

class Reactions {
  final String url;
  final int totalCount;
  final int the1;
  final int reactions1;
  final int laugh;
  final int hooray;
  final int confused;
  final int heart;
  final int rocket;
  final int eyes;

  Reactions({
    required this.url,
    required this.totalCount,
    required this.the1,
    required this.reactions1,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  factory Reactions.fromRawJson(String str) =>
      Reactions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "total_count": totalCount,
        "+1": the1,
        "-1": reactions1,
        "laugh": laugh,
        "hooray": hooray,
        "confused": confused,
        "heart": heart,
        "rocket": rocket,
        "eyes": eyes,
      };
}

enum State { OPEN }

final stateValues = EnumValues({"open": State.OPEN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
