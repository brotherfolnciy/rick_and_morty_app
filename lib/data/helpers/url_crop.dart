String cropCharacterUrlToId(String url) {
  final splashIndex = url.lastIndexOf('/');
  return url.substring(splashIndex + 1, url.length);
}
