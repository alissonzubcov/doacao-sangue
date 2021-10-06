class NoticiaEntity {
  String _titulo;
  String _texto;
  String _imagemUrl;
  String _linkUrl;

  NoticiaEntity();
  NoticiaEntity.padrao(
      String titulo, String texto, String imagemUrl, String linkUrl) {
    _titulo = titulo;
    _texto = texto;
    _imagemUrl = imagemUrl;
    _linkUrl = linkUrl;
  }

  String get getTitulo => _titulo;

  set setTitulo(String titulo) => this._titulo = titulo;

  String get getTexto => _texto;

  set setTexto(String texto) => this._texto = texto;

  String get getImagemUrl => _imagemUrl;

  set setImagemUrl(String imagemUrl) => this._imagemUrl = imagemUrl;

  String get getLinkUrl => _linkUrl;

  set setLinkUrl(String linkUrl) => this._linkUrl = linkUrl;
}
