abstract class ManageEvent{

}
class ViewSelection extends ManageEvent{
  final int index;
  ViewSelection(this.index);
}