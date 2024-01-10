// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenState {
  int get selectedAccountIndex => throw _privateConstructorUsedError;
  HomeScreenTab get currentTab => throw _privateConstructorUsedError;
  HomeScreenTab get previousTab => throw _privateConstructorUsedError;
  bool get scrollingAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res, HomeScreenState>;
  @useResult
  $Res call(
      {int selectedAccountIndex,
      HomeScreenTab currentTab,
      HomeScreenTab previousTab,
      bool scrollingAllowed});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res, $Val extends HomeScreenState>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAccountIndex = null,
    Object? currentTab = null,
    Object? previousTab = null,
    Object? scrollingAllowed = null,
  }) {
    return _then(_value.copyWith(
      selectedAccountIndex: null == selectedAccountIndex
          ? _value.selectedAccountIndex
          : selectedAccountIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as HomeScreenTab,
      previousTab: null == previousTab
          ? _value.previousTab
          : previousTab // ignore: cast_nullable_to_non_nullable
              as HomeScreenTab,
      scrollingAllowed: null == scrollingAllowed
          ? _value.scrollingAllowed
          : scrollingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeScreenStateImplCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$$HomeScreenStateImplCopyWith(_$HomeScreenStateImpl value,
          $Res Function(_$HomeScreenStateImpl) then) =
      __$$HomeScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedAccountIndex,
      HomeScreenTab currentTab,
      HomeScreenTab previousTab,
      bool scrollingAllowed});
}

/// @nodoc
class __$$HomeScreenStateImplCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res, _$HomeScreenStateImpl>
    implements _$$HomeScreenStateImplCopyWith<$Res> {
  __$$HomeScreenStateImplCopyWithImpl(
      _$HomeScreenStateImpl _value, $Res Function(_$HomeScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAccountIndex = null,
    Object? currentTab = null,
    Object? previousTab = null,
    Object? scrollingAllowed = null,
  }) {
    return _then(_$HomeScreenStateImpl(
      selectedAccountIndex: null == selectedAccountIndex
          ? _value.selectedAccountIndex
          : selectedAccountIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as HomeScreenTab,
      previousTab: null == previousTab
          ? _value.previousTab
          : previousTab // ignore: cast_nullable_to_non_nullable
              as HomeScreenTab,
      scrollingAllowed: null == scrollingAllowed
          ? _value.scrollingAllowed
          : scrollingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeScreenStateImpl implements _HomeScreenState {
  const _$HomeScreenStateImpl(
      {this.selectedAccountIndex = 0,
      this.currentTab = HomeScreenTab.transactions,
      this.previousTab = HomeScreenTab.transactions,
      this.scrollingAllowed = false});

  @override
  @JsonKey()
  final int selectedAccountIndex;
  @override
  @JsonKey()
  final HomeScreenTab currentTab;
  @override
  @JsonKey()
  final HomeScreenTab previousTab;
  @override
  @JsonKey()
  final bool scrollingAllowed;

  @override
  String toString() {
    return 'HomeScreenState(selectedAccountIndex: $selectedAccountIndex, currentTab: $currentTab, previousTab: $previousTab, scrollingAllowed: $scrollingAllowed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenStateImpl &&
            (identical(other.selectedAccountIndex, selectedAccountIndex) ||
                other.selectedAccountIndex == selectedAccountIndex) &&
            (identical(other.currentTab, currentTab) ||
                other.currentTab == currentTab) &&
            (identical(other.previousTab, previousTab) ||
                other.previousTab == previousTab) &&
            (identical(other.scrollingAllowed, scrollingAllowed) ||
                other.scrollingAllowed == scrollingAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedAccountIndex, currentTab,
      previousTab, scrollingAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenStateImplCopyWith<_$HomeScreenStateImpl> get copyWith =>
      __$$HomeScreenStateImplCopyWithImpl<_$HomeScreenStateImpl>(
          this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState(
      {final int selectedAccountIndex,
      final HomeScreenTab currentTab,
      final HomeScreenTab previousTab,
      final bool scrollingAllowed}) = _$HomeScreenStateImpl;

  @override
  int get selectedAccountIndex;
  @override
  HomeScreenTab get currentTab;
  @override
  HomeScreenTab get previousTab;
  @override
  bool get scrollingAllowed;
  @override
  @JsonKey(ignore: true)
  _$$HomeScreenStateImplCopyWith<_$HomeScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
