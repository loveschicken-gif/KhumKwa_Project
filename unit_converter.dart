
import 'package:khum_kwa/features/compare/models/product.dart';
class UnitConverter {
  static double getNormalizedQuantity(double quantity, ProductUnit unit) {
    if (unit == ProductUnit.kg || unit == ProductUnit.l) return quantity * 1000;
    return quantity;
  }
  static bool areCompatible(ProductUnit a, ProductUnit b) {
    const weight = {ProductUnit.g, ProductUnit.kg};
    const volume = {ProductUnit.ml, ProductUnit.l};
    const count = {ProductUnit.piece};
    if (weight.contains(a) && weight.contains(b)) return true;
    if (volume.contains(a) && volume.contains(b)) return true;
    if (count.contains(a) && count.contains(b)) return true;
    return false;
  }
  static String baseUnitLabel(ProductUnit unit) {
    if (unit == ProductUnit.g || unit == ProductUnit.kg) return 'กรัม';
    if (unit == ProductUnit.ml || unit == ProductUnit.l) return 'มล.';
    return 'ชิ้น';
  }
}
