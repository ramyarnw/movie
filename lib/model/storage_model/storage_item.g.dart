// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StorageItem> _$storageItemSerializer = new _$StorageItemSerializer();

class _$StorageItemSerializer implements StructuredSerializer<StorageItem> {
  @override
  final Iterable<Type> types = const [StorageItem, _$StorageItem];
  @override
  final String wireName = 'StorageItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, StorageItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StorageItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StorageItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StorageItem extends StorageItem {
  @override
  final String key;
  @override
  final String value;

  factory _$StorageItem([void Function(StorageItemBuilder)? updates]) =>
      (new StorageItemBuilder()..update(updates))._build();

  _$StorageItem._({required this.key, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(key, r'StorageItem', 'key');
    BuiltValueNullFieldError.checkNotNull(value, r'StorageItem', 'value');
  }

  @override
  StorageItem rebuild(void Function(StorageItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StorageItemBuilder toBuilder() => new StorageItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StorageItem && key == other.key && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StorageItem')
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class StorageItemBuilder implements Builder<StorageItem, StorageItemBuilder> {
  _$StorageItem? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  StorageItemBuilder();

  StorageItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StorageItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StorageItem;
  }

  @override
  void update(void Function(StorageItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StorageItem build() => _build();

  _$StorageItem _build() {
    final _$result = _$v ??
        new _$StorageItem._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'StorageItem', 'key'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'StorageItem', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
